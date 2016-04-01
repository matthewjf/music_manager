module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    html = "<pre>"
    html += "♫ " + h(lyrics).split("\n").join("\n♫ ")
    html += "</pre>"

    html.html_safe
  end
end
