# workflow

## installation

```shell
## use yarn
$ yarn init 
$ yarn add webpack webpack-cli -gD

```

## config

```javascript
// filename: webpack.config.js

module.exports = {
  entry: './index.js',
  path: {
    filename: 'bundle.js',
    path: __dirname + '/dist'
  },
  target: 'web',
  // for watch mode to continously watching input files and bunling them. 
  watch: true,
  // for production output
  mode: 'production'
};

```



## build

```bash
## add new command 'build' for bundle in package.json {'script': { 'build': 'webpack', 'watch': 'webpack --watch'}}
$ yarn run build  ## just build the bundle file
$ yarn run watch  ## continously watch input files and bundle them when updated
```



