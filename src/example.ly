\version "2.24.0"

\header {
  title = "Example LilyPond Score"
  composer = "Your Name"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url "http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    
    \relative c' {
      c4 d e f |
      g a b c |
      c b a g |
      f e d c |
      
      \repeat volta 2 {
        e4 f g a |
        b c d e |
      }
      \alternative {
        { f e d c | }
        { f g a b | c1 | }
      }
    }
  }
  
  \layout { }
  \midi { }
}