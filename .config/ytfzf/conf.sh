notify_playing=1
async_thumbnails=0

  video_player () {
   #1="${@: -1}"
   nohup /usr/bin/mpv "$1" &
   echo "$1" |  xsel -ib &
  }
 # video_player $1

