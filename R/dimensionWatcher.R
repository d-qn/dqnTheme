##' html code to call Tamedia dimensionWatcher
##' 
##' snippet to include in page of dynamic sizing of iframe 
##' 
##' @export
##' @seealso 
##' @examples
##' \dontrun{
##' dimensionWatcher
##' }

dimensionWatcher <- "<script src='https://files.newsnetz.ch/scripts/dimension_watcher.js'></script>
  <script>
  DimensionWatcher.enableParentNotification(
    function() {
      return $('body').width();
    },
    function() {
      return $('body').height();
    }
  );
</script>"
  