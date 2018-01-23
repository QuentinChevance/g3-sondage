module.exports = {
    context: __dirname,
    entry: {
        exercice10: "./src/index.tsx"
        },
    devtool: "source-map",
    output: {
        filename: "dist/index.js"
    },
    resolve: {
        
                modules: [
                    'node_modules'
                ],
        
                // Add '.ts' and '.tsx' as resolvable extensions.
                extensions: [".webpack.js", ".web.js", ".ts", ".tsx", ".js", ".css",".html"]
            },
    module: {
        rules: [
            {
                test: /\.ts$/,
                use:[
                    {
                        loader:"awesome-typescript-loader"
                    }
                ]
            },
            {
                test: /\.tsx$/,
                use:[
                    {
                        loader:"awesome-typescript-loader"
                    }
                ]
            },
            {
                test: /\.css$/,
                use: [    
                    { loader: "style-loader" },               
                    { loader: "css-loader" }                          
                ]
            }, {
                test: /\.html$/,
                use: [                   
                    {
                        loader: "file-loader",
                        options: {
                            name: "[name].[ext]",
                            outputPath: "dist/"
                        }
                    }
                ]
            },
            {
                test: /\.png$/,
                use: [                   
                    { loader: "url-loader"}
                ]
            }
        ]
    }
}