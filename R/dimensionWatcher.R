##' html code to call Tamedia dimensionWatcher
##' 
##' snippet to include in page of dynamic sizing of iframe 
##'
##' @export
##' @examples
##' \dontrun{
##' dimensionWatcher
##' }

dimensionWatcher <- '<script src="https://interaktiv.tagesanzeiger.ch/static/dimension_watcher.js"></script>
  <script>
  DimensionWatcher.enableParentNotification(
    function() {
      return "100%"
    },
    function() {
      return document.body.scrollHeight
    }
  );
</script>'
  