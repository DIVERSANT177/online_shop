// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery3"
import "jquery_ujs"
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "store"

const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

