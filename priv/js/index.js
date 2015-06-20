var websocket;
      var connected = false;

      $(document).ready(init);

      function init() {
          document.getElementsByName("open")[0].disabled = true;
          document.getElementsByName("close")[0].disabled = true;
          if(!("WebSocket" in window)){
              $('#status').append('<p><span style="color: red;">websockets not supported </span></p>');
              $("#navigation").hide();
          } else {
              $('#status').append('<p><span style="color: green;">websockets supported </span></p>');
              websocket = connect('/websocket');
              var second_socket = connect('/second_socket');

              second_socket.onmessage = function(evt) { showList(evt) }
          };
      };

      function connect(socket_url) {
          var wssocket;
          //wsHost = window.location.hostname
          wsHost = 'ws://' + 'localhost' + ':8090' + socket_url;
          $('#connection').text('Connecting');
          wssocket = $.bullet(wsHost);
          wssocket.onopen = function(evt) { onOpen(evt) };
          wssocket.onclose = function(evt) { onClose(evt) };
          wssocket.onmessage = function(evt) { onMessage(evt) };
          wssocket.onerror = function(evt) { onError(evt) };
          wssocket.onheartbeat = function(evt) { onHeartbeat(evt) };
          return wssocket;
      };

      function disconnect() {
          websocket.close();
      };

      function onOpen(evt) {
          $('#connection').text('Connected');
          connected = true;
          document.getElementsByName("open")[0].disabled = true;
          document.getElementsByName("close")[0].disabled = false;
      };

      function onClose(evt) {
          $('#connection').text('Disconnected');
          connected = false;
          document.getElementsByName("open")[0].disabled = false;
          document.getElementsByName("close")[0].disabled = true;
      };

      function onMessage(evt) {
        showMessage(evt.data);
      };

      function showList(evt) {
        console.log(evt.data)
      }

      function onHeartbeat(evt) {
      };

      function sendTxt() {
          if(websocket.readyState == websocket.OPEN){
            txt = $("#message_text").val();
            websocket.send(txt);
            clearInput();
          } else {
              //
          };
      };

      function showMessage(txt) {
          var now = getTimeStamp();
          $("#msgs_last").text(now);
          $("#msgs").text(txt);
      };

      function clearInput(){
        inputBox = document.getElementById('message_text');
        inputBox.value = "";
        inputBox.focus();
      }

      function getTimeStamp() {
       var now = new Date();
       return ((now.getDate()) + '/' + (now.getMonth() + 1) + '/' + now.getFullYear() + " " + now.getHours() + ':'
                     + ((now.getMinutes() < 10) ? ("0" + now.getMinutes()) : (now.getMinutes())) + ':' + ((now.getSeconds() < 10) ? ("0" + now
                     .getSeconds()) : (now.getSeconds())));
      }
