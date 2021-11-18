# Lynx Text Browser FTW!

*New and Improved! You can now test this as a [container]:*

```
docker run -it --rm rwxrob/lynx
```

It might be the oldest web browser currently under active maintenance but it is still hands down the single best browser for rapid research. Lynx does not even look at the bloat of images, CSS, and JavaScript when loading making it objectively the fastest possible way to browse the text of web sites. When combined with a `?` (`duck`) and `??` (`google`) command you fill find results to documentation queries and technical documentation as fast as it takes to open a local `man` page.

## You must add the following line in your bashrc to get this to work

```
export PATH=~/.local/bin/scripts:$PATH

```
This will force the lynx script located in `$HOME/.local/bin/scripts` to be executed before the binary. 



