require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";


import {initCalendar} from '../plugins/calendar.js';

if (document.getElementById('calendar')){
  initCalendar();
}

