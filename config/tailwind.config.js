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
      aspectRatio: {
        'book': '3 / 5',
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
        brand: {
          '50': '#f6f6f9',
          '100': '#eeeef4',
          '200': '#d4d4e3',
          '300': '#b9bad2',
          '400': '#8586b1',
          '500': '#51528f',
          '600': '#494a81',
          '700': '#3d3e6b',
          '800': '#313156',
          '900': '#282846',
          dark: '#282846',
          DEFAULT: '#51528f',
          light: '#d4d4e3'
        },
        accent: {
          '50': '#f6f8f9',
          '100': '#eef1f4',
          '200': '#d4dce3',
          '300': '#b9c6d2',
          '400': '#859cb1',
          '500': '#51718f',
          '600': '#496681',
          '700': '#3d556b',
          '800': '#314456',
          '900': '#283746',
          light: '#d4dce3',
          DEFAULT: '#51718f',
          dark: '#283746',
        },
        detail: {
          '50': '#f8f6f9',
          '100': '#f1eef4',
          '200': '#dbd4e3',
          '300': '#c5b9d2',
          '400': '#9a85b1',
          '500': '#6f518f',
          '600': '#644981',
          '700': '#533d6b',
          '800': '#433156',
          '900': '#362846',
          light: '#dbd4e3',
          DEFAULT: '#6f518f',
          dark: '#433156'
        },
        info: {
          light: '#d9eff9',
          DEFAULT: '#47c0e8',
          dark: '#254A5B',
        },
        warning: {
          light: '#fceed1',
          DEFAULT: '#e1bf44',
          dark: '#6b5b27',
        },
        success: {
          light: '#d9f4d6',
          DEFAULT: '#52ce5c',
          dark: '#2B502B',
        },
        danger: {
          light: '#ffd2d1',
          DEFAULT: '#e24154',
          dark: '#6c272c',
        },
        amazon: {
          light: '#ffe5c6',
          DEFAULT: '#ff9900',
          dark: '#794b13',
        },
        audible: {
          light: '#eec6bd',
          DEFAULT: '#961110',
          dark: '#4c140c',
        },
        kindle: {
          light: '#d4e0f8',
          DEFAULT: '#198ae2',
          dark: '#20446a',
        },
        nobles: {
          light: '#ccd3d5',
          DEFAULT: '#3e5962',
          dark: '#222e32',
        },
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
