console.log('Hello World from Webpacker')
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker",{
	altInput: true,
	"locale": French

});