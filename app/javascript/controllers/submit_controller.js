// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from '@rails/ujs';
export default class extends Controller {

  connect() {
    console.log('hello')
  }

  go() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };
          console.log(pos);
          Rails.ajax({
            type: "post",
            url: '/localization',
            data: `lat=${pos.lat}&lon=${pos.lng}`
          })

        });
    } else {
      console.log('not working')
    }
    
  }
}
