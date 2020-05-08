import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import { csrfToken } from "@rails/ujs";

import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';
import '@fullcalendar/timegrid/main.css';
import '@fullcalendar/list/main.css';

const initCalendar = () => {
  document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    const trainerId = calendarEl.dataset.trainer
    const currentUser = calendarEl.dataset.user
    const calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, timeGridPlugin, interactionPlugin],
      // aspectRatio: 1.5,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      buttonText: {
        today:    "aujourd'hui",
        month:    'mois',
        week:     'semaine',
        day:      'jour'
      },
      allDaySlot: false,
      defaultView: 'timeGridWeek',
      fixedWeekCount: 6,
      locale: 'fr',
      firstDay: 1,
      slotDuration: '00:30:00',
      minTime: "06:00:00",
      maxTime: "23:00:00",
      scrollTime: "06:00:00",
      businessHours: {
        daysOfWeek: [ 0, 1, 2, 3, 4, 5, 6 ], // sunday => 0
        startTime: '06:00',
        endTime: '23:00',
      },
      eventSources: [
        {
          url: `/api/v1/users/${trainerId}/courses`,
          color: 'orange'
        },
        {
          url: `/api/v1/users/${trainerId}/slots`,
          color: 'green'
        },
      ],
      editable: trainerId === currentUser,
      eventResize: fetchStartEnd,
      eventDrop: fetchStartEnd,
      dateClick: function(info) {
        console.log(info.dateStr)
        document.getElementById('add-course-btn').click()
      }
      // eventRender:
    });
    calendar.render();
  });
}

const fetchStartEnd = (info) => {
  console.log(info)
  fetch(`/${info.event.source.url.split('/')[5]}/${info.event.id}/update_time?end=${info.event.end}&start=${info.event.start}`, {
    method: "POST",
    headers: {
      accept: 'application/json',
      'X-CSRF-Token': csrfToken()
    }
  })
}

export {initCalendar};
