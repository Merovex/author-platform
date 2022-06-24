// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import { registerControllersFrom } from "@hotwired/stimulus-importmap-autoloader"
registerControllersFrom("controllers", application)

// Start StimulusJS
import { Application } from "@hotwired/stimulus"

const application = Application.start();

// Import and register all TailwindCSS Components
import { Alert, Autosave, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
application.register('alert', Alert)
application.register('autosave', Autosave)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)