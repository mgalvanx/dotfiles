notify_playing=1
async_thumbnails=0

video_player () {
  tsp /usr/bin/mpv "$1" &
  echo "$1" |  xsel -ib &
  espeak -v en-gb "Video is playing! Can't beat no ads." 
 }

