import React, { Component } from 'react';
import mdcAutoInit from '@material/auto-init';
import { MDCTextField } from '@material/textfield';
import { BrowserRouter as Link } from "react-router-dom";
import axios from 'axios';

class loginForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            email: this.props.email,
            password: this.props.password
        }
    }
    componentDidMount() {
        mdcAutoInit.register('MDCTextField', MDCTextField);
        mdcAutoInit();
    }

    onStateChange(event) {
        this.setState({ [event.target.id]: event.target.value });
    };

    submit() {
        let self = this;
        axios.post(
            `http://` + window.location.hostname + `:4000/session`,
            {
                email: this.state.email,
                password: this.state.password

            }
        ).then(response => {
            if (response.status === 200) {
                localStorage.setItem("auth_token", response.data.auth_token);
                self.props.handler();
            }
        }).catch(error => {
            alert("L'adresse email ou le mot de passe renseigné est invalide.");
            console.error(error);
        })
    };

    render() {
        return (
            <div className="card">
                <div className="mdc-text-field" data-mdc-auto-init="MDCTextField">
                    <input type="email" className="mdc-text-field__input" onChange={this.onStateChange.bind(this)} id="email" />
                    <label htmlFor="email" className="mdc-text-field__label" >E-mail</label>
                </div>
                <div className="mdc-text-field" data-mdc-auto-init="MDCTextField">
                    <input type="password" className="mdc-text-field__input" onChange={this.onStateChange.bind(this)} id="password" />
                    <label htmlFor="password" className="mdc-text-field__label">Mot de passe</label>

                </div>
                <Link to="/dashboard" className="Button--small">
                    <button type="button" className="mdc-button mdc-button--raised" onClick={this.submit.bind(this)}>
                        Connexion
                    </button>
                </Link>
            </div>

        );
    }
}

export default loginForm