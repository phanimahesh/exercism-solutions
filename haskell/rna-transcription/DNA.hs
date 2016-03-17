module DNA(toRNA) where

toRNA = map transcribe

transcribe 'A' = 'U'
transcribe 'T' = 'A'
transcribe 'C' = 'G'
transcribe 'G' = 'C'
