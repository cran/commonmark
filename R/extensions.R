#' Github CommonMark Extensions
#'
#' The Github fork of cmark supports several markdown extensions which provide
#' features which are not (yet) in the official commonmark spec.
#'
#' Currently the following extensions are supported:
#'
#'  - **table** support rendering of tables
#'  - **strikethrough** via `~sometext~` syntax
#'  - **autolink** automatically turn URLs into hyperlinks
#'  - **tagfilter** blacklist html tags: `title` `textarea` `style` `xmp` `iframe`
#' `noembed` `noframes` `script` `plaintext`.
#'
#' See also the spec for [GitHub Flavored Markdown](https://github.github.com/gfm/).
#'
#' @export
#' @name extensions
#' @rdname extensions
#' @useDynLib commonmark R_list_extensions
#' @examples print(list_extensions())
list_extensions <- function(){
  .Call(R_list_extensions)
}

get_extensions <- function(x){
  if(identical(x, FALSE))
    return(NULL)
  exts <- list_extensions()
  if(isTRUE(x))
    return(exts)
  found <- match(x, exts)
  unfound <- is.na(found)
  if(any(unfound)){
    stop("Invalid commonmark extensions: ", paste(x[unfound], collapse = ", "), call. = FALSE)
  }
  return(x)
}

