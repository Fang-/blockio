::
::::  /hoon/balance/blockio/mar
  ::
/-  blockio
/+  blockio, httr-to-json
[. blockio]  ::TODO  =,
|_  bal/(each balance error)
::
++  grab                                                ::>  convert to balance
  |%
  ++  noun  &+balance                                   ::<  ...from noun
  ::
  ++  httr                                              ::<  ...from http result
    |=  hit/httr:eyre
    ::NOTE  because httr-to-json errors if not status 2xx.
    (json (httr-to-json hit(p 200)))
  ::
  ++  json                                              ::>  ...from json
    =>  [dejs-soft:format .]  ::TODO  =,
    |=  jon/json
    ^-  (each balance error)
    =+  (need ((ot data+(om sa) ~) jon))
    ?:  (~(has by -) 'error_message')
      |+(~(got by -) 'error_message')
    :-  %&
    :+  (net-cur (~(got by -) 'network'))
      (~(got by -) 'available_balance')
    (~(got by -) 'pending_received_balance')
  --
--
