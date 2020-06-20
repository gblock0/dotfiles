-- Show music info if Spotify is playing music
if application "Spotify" is running then
    tell application "Spotify"
        set theName to name of the current track
        set theArtist to artist of the current track
        try
            return "♫  " & theName & " - " & theArtist
        on error err
        end try
    end tell
end if

-- Show music info if the Apple Music app is playing music
if application "Music" is running then
    tell application "Music"
        if exists current track then
            set theName to the name of the current track
            set theArtist to the artist of the current track
            try
                return "♫  " & theName & " - " & theArtist
            on error err
            end try
        end if
    end tell
end if
