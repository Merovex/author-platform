const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/helpers/**/*',
    './app/components/**/*',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,html,slim}',
    './vendor/javascript/tailwindcss-stimulus-components.js'
  ],
  theme: {
    extend: {
      screens: {
        'print': { 'raw': 'print' },
      },
      lineClamp: {
        7: '7',
        8: '8',
        9: '9',
        10: '10',
      },
      typography: (theme) => ({
        light: {
          css: {
            'background': 'none',
            color: theme('colors.black'),
            a: {
              color: theme('colors.blue.500'),
              '&:visited': {
                color: theme('colors.violet.500'),
              },
            },
            'p+p': {
              'text-indent': '2rem',
              'margin': '0',
            },
          },
        },
        dark: {
          css: {
            color: theme('colors.gray.50'),
            a: {
              color: theme('colors.blue.300'),
              '&:hover': {
                color: theme('colors.blue.100'),
              },
              '&:visited': {
                color: theme('colors.violet.300'),
              }
            },
            'p, li': {
              color: theme('colors.gray.100')
            },
            'p+p': {
              'text-indent': '2rem',
              'margin': 0,
            },
            blockquote: {
              color: theme('colors.gray.200'),
            },
            strong: {
              color: theme('colors.yellow.300'),
              'font-weight': 'bold'
            },
            'h1,h2,h3,h4,h5': {
              color: theme('colors.brand.200')
            },
          },
        }
      }),
      colors: {
        brand: colors.slate,
        gray: colors.stone,
        heatmap: colors.emerald,
        'black': {
          'DEFAULT': '#1c1917'
        },
        'white': {
          'DEFAULT': '#fafaf9'
        },
      },
      fontFamily: {
        'sans': ["Merovex Sans", ...defaultTheme.fontFamily.sans],
        'serif': ["Merovex Serif", ...defaultTheme.fontFamily.serif],
        'display': ["Merovex Display", ...defaultTheme.fontFamily.sans]
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
  ]
}
