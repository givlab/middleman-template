method = undefined

noop = ->

methods = [
  'assert'
  'clear'
  'count'
  'debug'
  'dir'
  'dirxml'
  'error'
  'exception'
  'group'
  'groupCollapsed'
  'groupEnd'
  'info'
  'log'
  'markTimeline'
  'profile'
  'profileEnd'
  'table'
  'time'
  'timeEnd'
  'timeline'
  'timelineEnd'
  'timeStamp'
  'trace'
  'warn'
]
length = methods.length
console = window.console = window.console or {}
while length--
  method = methods[length]
  # Only stub undefined methods.
  if !console[method]
    console[method] = noop