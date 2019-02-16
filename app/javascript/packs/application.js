import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker",{
	altInput: true,
	"locale": French,
	firstDayOfWeek: 1,
});