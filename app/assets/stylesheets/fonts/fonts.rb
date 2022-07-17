fonts = %w[FjallaOne-Regular.ttf
           SourceCodePro-Black.ttf
           SourceCodePro-BlackItalic.ttf
           SourceCodePro-Bold.ttf
           SourceCodePro-BoldItalic.ttf
           SourceCodePro-ExtraBold.ttf
           SourceCodePro-ExtraBoldItalic.ttf
           SourceCodePro-Italic.ttf
           SourceCodePro-Medium.ttf
           SourceCodePro-MediumItalic.ttf
           SourceCodePro-Regular.ttf
           SourceCodePro-SemiBold.ttf
           SourceCodePro-SemiBoldItalic.ttf
           SourceSansPro-Black.ttf
           SourceSansPro-BlackItalic.ttf
           SourceSansPro-Bold.ttf
           SourceSansPro-BoldItalic.ttf
           SourceSansPro-Italic.ttf
           SourceSansPro-Regular.ttf
           SourceSansPro-SemiBold.ttf
           SourceSansPro-SemiBoldItalic.ttf
           SourceSerifPro-Black.ttf
           SourceSerifPro-BlackItalic.ttf
           SourceSerifPro-Bold.ttf
           SourceSerifPro-BoldItalic.ttf
           SourceSerifPro-Italic.ttf
           SourceSerifPro-Regular.ttf
           SourceSerifPro-SemiBold.ttf
           SourceSerifPro-SemiBoldItalic.ttf]

fonts = %w[
  LibreFranklin-Black.ttf
  LibreFranklin-MediumItalic.ttf
  LibreFranklin-BlackItalic.ttf
  LibreFranklin-Regular.ttf
  LibreFranklin-Bold.ttf
  LibreFranklin-Italic.ttf
  LibreFranklin-SemiBold.ttf
  LibreFranklin-BoldItalic.ttf
  LibreFranklin-SemiBoldItalic.ttf
  LibreFranklin-ExtraBold.ttf
  LibreFranklin-Thin.ttf
  LibreFranklin-ExtraBoldItalic.ttf
  LibreFranklin-Medium.ttf
  LibreFranklin-ThinItalic.ttf
  Merriweather-Black.ttf
  Merriweather-Bold.ttf
  Merriweather-Italic.ttf
  Merriweather-BlackItalic.ttf 
  Merriweather-BoldItalic.ttf
  Merriweather-Regular.ttf
]

contents = fonts.map do |font|
  weight = case true
           when font.include?('SemiBold')
             600
           when font.include?('Bold')
             800
           when font.include?('Medium')
             500
           else
             400
           end
  type = if font.include?('Code')
           'Code'
         elsif font.include?('Sans')
           'Sans'
         elsif font.include?('FjallaOne')
           'Display'
         else
           'Serif'
         end
  style = font.include?('Italic') ? 'italic' : 'normal'
  template = <<~EOS
    @font-face {
      font-family: 'Merovex #{type}';
      font-display: swap;
      font-weight: #{weight};
      font-style: #{style};
      font-stretch: normal;
      src: url('./fonts/#{font}') format('truetype');
    }
  EOS
  template
end.join("\n")
puts contents
