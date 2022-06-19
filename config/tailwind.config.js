const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,html,slim}'
  ],
  theme: {
    extend: {
      screens: {
        'print': { 'raw': 'print' },
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
          50: "#e3e4ea",
          100: "#c8cbd6",
          200: "#adb2c3",
          300: "#9299b2",
          400: "#7782a2",
          500: "#5c6b94",
          600: "#46557b",
          700: "#35405d",
          800: "#242c40",
          900: "#151925",
        },
        gray: {
          50: "#f2f2f3",
          100: "#e5e5e6",
          200: "#cacbce",
          300: "#b0b1b5",
          400: "#95979d",
          500: "#7b7d84",
          600: "#62646a",
          700: "#4a4b4f",
          800: "#313235",
          900: "#19191a"
        },
        indigo: {
          50: "#eef0f6",
          100: "#dde1ee",
          200: "#bcc3dc",
          300: "#9aa5cb",
          400: "#7987b9",
          500: "#5769a8",
          600: "#465486",
          700: "#343f65",
          800: "#232a43",
          900: "#111522"
        },
        violet: {
          50: "#f0eef6",
          100: "#e2ddee",
          200: "#c4bcdc",
          300: "#a79acb",
          400: "#8a79b9",
          500: "#6d57a8",
          600: "#574686",
          700: "#413465",
          800: "#2b2343",
          900: "#161122"
        },
        purple: {
          50: "#f4eef6",
          100: "#eaddee",
          200: "#d5bcdc",
          300: "#c09acb",
          400: "#ab79b9",
          500: "#9657a8",
          600: "#784686",
          700: "#5a3465",
          800: "#3c2343",
          900: "#1e1122"
        },
        pink: {
          50: "#f6eef4",
          100: "#eedde9",
          200: "#dcbcd4",
          300: "#cb9abe",
          400: "#b979a8",
          500: "#a85792",
          600: "#864675",
          700: "#653458",
          800: "#43233b",
          900: "#22111d"
        },
        red: {
          50: "#f6eef0",
          100: "#eedde1",
          200: "#dcbcc3",
          300: "#cb9aa5",
          400: "#b97987",
          500: "#a85769",
          600: "#864654",
          700: "#65343f",
          800: "#43232a",
          900: "#221115"
        },
        orange: {
          50: "#f6f0ee",
          100: "#eee2dd",
          200: "#dcc4bc",
          300: "#cba79a",
          400: "#b98a79",
          500: "#a86d57",
          600: "#865746",
          700: "#654134",
          800: "#432b23",
          900: "#221611"
        },
        yellow: {
          50: "#f6f4ee",
          100: "#eeeadd",
          200: "#dcd5bc",
          300: "#cbc09a",
          400: "#b9ab79",
          500: "#a89657",
          600: "#867846",
          700: "#655a34",
          800: "#433c23",
          900: "#221e11"
        },
        lime: {
          50: "#f4f6ee",
          100: "#e9eedd",
          200: "#d4dcbc",
          300: "#becb9a",
          400: "#a8b979",
          500: "#92a857",
          600: "#758646",
          700: "#586534",
          800: "#3b4323",
          900: "#1d2211"
        },
        green: {
          50: "#f0f6ee",
          100: "#e1eedd",
          200: "#c3dcbc",
          300: "#a5cb9a",
          400: "#87b979",
          500: "#69a857",
          600: "#548646",
          700: "#3f6534",
          800: "#2a4323",
          900: "#152211"
        },
        teal: {
          50: "#eef6f0",
          100: "#ddeee2",
          200: "#bcdcc4",
          300: "#9acba7",
          400: "#79b98a",
          500: "#57a86d",
          600: "#468657",
          700: "#346541",
          800: "#23432b",
          900: "#112216"
        },
        cyan: {
          50: "#eef6f4",
          100: "#ddeeea",
          200: "#bcdcd5",
          300: "#9acbc0",
          400: "#79b9ab",
          500: "#57a896",
          600: "#468678",
          700: "#34655a",
          800: "#23433c",
          900: "#11221e"
        },
        blue: {
          50: "#eef4f6",
          100: "#dde9ee",
          200: "#bcd4dc",
          300: "#9abecb",
          400: "#79a8b9",
          500: "#5792a8",
          600: "#467586",
          700: "#345865",
          800: "#233b43",
          900: "#111d22"
        },
        heatmap: {
          50: "#f0f6ee",
          100: "#e1eedd",
          200: "#c3dcbc",
          300: "#a5cb9a",
          400: "#87b979",
          500: "#69a857",
          600: "#548646",
          700: "#3f6534",
          800: "#2a4323",
          900: "#152211"
        },
        'black': {
          'DEFAULT': '#1c1917'
        },
        'white': {
          'DEFAULT': '#fafaf9'
        },
      },
      fontFamily: {
        'sans': ["MerovexSans", ...defaultTheme.fontFamily.sans],
        'serif': ["MerovexSerif", ...defaultTheme.fontFamily.serif],
        'display': ["MerovexDisplay", "MerovexSans", ...defaultTheme.fontFamily.sans]
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
