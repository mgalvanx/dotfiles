#notify_playing=1
async_thumbnails=0

video_player () {
  setsid -f mpv --title='ytfzf-mpv' --really-quiet --no-terminal  --ontop --no-border --force-window --autofit=500x280 --geometry=-15-60 "$@"
}

video_player
