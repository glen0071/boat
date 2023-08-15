# frozen_string_literal: true


# Identify author, source, 

ARABIC_HIDDEN_WORDS_ARRAY = [
  {
    text: "O Son of Spirit! My first counsel is this: Possess a pure, kindly and radiant heart, that thine may be a sovereignty ancient, imperishable and everlasting.",
    context: 'From the Arabic',
    page: '1'
  },
  {
    text: "O Son of Spirit! The best beloved of all things in My sight is Justice; turn not away therefrom if thou desirest Me, and neglect it not that I may confide in thee. By its aid thou shalt see with thine own eyes and not through the eyes of others, and shalt know of thine own knowledge and not through the knowledge of thy neighbor. Ponder this in thy heart; how it behooveth thee to be. Verily justice is My gift to thee and the sign of My loving-kindness. Set it then before thine eyes.",
    context: 'From the Arabic',
    page: '2'
  },
  {
    text: "O Son of Man! Veiled in My immemorial being and in the ancient eternity of My essence, I knew My love for thee; therefore I created thee, have engraved on thee Mine image and revealed to thee My beauty.",
    context: 'From the Arabic',
    page: '3'
  },
  {
    text: "O Son of Man! I loved thy creation, hence I created thee. Wherefore, do thou love Me, that I may name thy name and fill thy soul with the spirit of life.",
    context: 'From the Arabic',
    page: '4'
  },
  {
    text: "O Son of Man! Love Me, that I may love thee. If thou lovest Me not, My love can in no wise reach thee. Know this, O servant.",
    context: 'From the Arabic',
    page: '5'
  },
  {
    text: "O Son of Being! Thy Paradise is My love; thy heavenly home, reunion with Me. Enter therein and tarry not. This is that which hath been destined for thee in Our kingdom above and Our exalted dominion.",
    context: 'From the Arabic',
    page: '6'
  },
  {
    text: "O Son of Man! If thou lovest Me, turn away from thyself; and if thou seekest My pleasure, regard not thine own; that thou mayest die in Me and I may eternally live in thee.",
    context: 'From the Arabic',
    page: '7'
  },
  {
    text: "O Son of Spirit! There is no peace for thee save by renouncing thyself and turning unto Me; for it behooveth thee to glory in My name, not in thine own; to put thy trust in Me and not in thyself, since I desire to be loved alone and above all that is.",
    context: 'From the Arabic',
    page: '8'
  },
  {
    text: "O Son of Being! My love is My stronghold; he that entereth therein is safe and secure, and he that turneth away shall surely stray and perish.",
    context: 'From the Arabic',
    page: '9'
  },
  {
    text: "O Son of Utterance! Thou art My stronghold; enter therein that thou mayest abide in safety. My love is in thee, know it, that thou mayest find Me near unto thee.",
    context: 'From the Arabic',
    page: '10'
  },
  {
    text: "O Son of Being! O SON OF BEING!
    Thou art My lamp and My light is in thee. Get thou from it thy radiance and seek none other than Me. For I have created thee rich and have bountifully shed My favor upon thee.",
    context: 'From the Arabic',
    page: '11'
  },
].freeze

baha = Author.find_by('name like ?', 'Bah%')
hidden = Source.find_or_create_by(title: 'Hidden Words')

ARABIC_HIDDEN_WORDS_ARRAY.each do |quote|
  Quote.find_or_create_by(
    text: quote[:text],
    source: hidden,
    author: baha
  )
end
