:: echo %*.mp4

ffmpeg -i "%*.mp4" -f avi -vcodec rawvideo "%*.avi"
