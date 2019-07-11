#######################
# youtube-dl
######################

ytv() {
    local clip=$(pbpaste)
    local url=${1:-$clip}

    echo "ytdlv $url" >> ~/bin/ytgo
    echo "ytdlv $url"
}

yta() {
    local clip=$(pbpaste)
    local url=${1:-$clip}

    echo "ytdla $url" >> ~/bin/ytgo
    echo "ytdla $url"
}

#!/bin/bash

# -x, --extract-audio              Convert video files to audio-only files
#                                (requires ffmpeg or avconv and ffprobe or
#                                avprobe)
# -c, --continue                   Force resume of partially downloaded files.
#                                  By default, youtube-dl will resume
#                                  downloads if possible.

# --sleep-interval SECONDS         Number of seconds to sleep before each
#                                  download when used alone or a lower bound
#                                  of a range for randomized sleep before each
#                                  download (minimum possible number of
#                                  seconds to sleep) when used along with
#                                  --max-sleep-interval.
# --max-sleep-interval SECONDS     Upper bound of a range for randomized sleep
#                                  before each download (maximum possible
#                                  number of seconds to sleep). Must only be
#                                  used along with --min-sleep-interval.

# --yes-playlist                   Download the playlist, if the URL refers to
#                                  a video and a playlist.
# the operative word here is IF, so leaving this in seems harmless for my purposes

# --no-warnings                    Ignore warnings
# I think this is to allow us to continue on playlist if there a software error with a parictular file

# -i, --ignore-errors              Continue on download errors, for example to
#                                  skip unavailable videos in a playlist

# --download-archive FILE          Download only videos not listed in the
#                                  archive file. Record the IDs of all
#                                  downloaded videos in it.

# If I always specificy the same archive I should be safe just spamming this command and being sure im not filling up HD un-necessarily

ytdlv() {
    clipboard=$(pbpaste)
    yturl=${1:-$clipboard}

    echo  downloading "$yturl"

    youtube-dl -c --sleep-interval 2 --max-sleep-interval 4 --yes-playlist --no-warnings --playlist-reverse --download-archive ~/personal/media/.yt-dl-archive/archive -o "~/personal/media/video/capture/%(title)s-%(id)s.%(ext)s" $yturl
}

ytdla() {
    clipboard=$(pbpaste)
    yturl=${1:-$clipboard}

    echo  downloading "$yturl"

    youtube-dl  -x  -c --sleep-interval 2 --max-sleep-interval 4 --yes-playlist --no-warnings --playlist-reverse --download-archive ~/personal/media/.yt-dl-archive/archive --audio-format 'mp3' -i --audio-quality 0 -o "~/personal/media/audio/capture/%(title)s-%(id)s.%(ext)s" $yturl
}
