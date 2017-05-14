function require(path) {
    if (path !== null) {
        var _import = document.createElement('script');
        _import.src = path;
        document.head.appendChild(_import);
    }
}
