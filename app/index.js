import React from "react"
import ReactDOM from 'react-dom'
import {Provider} from "react-redux"

import store from './state'
import I18n from "i18n-js"
import "./translations/en"

import App from "./components/App/App"

const rootEl = document.getElementById("root");

I18n.defaultLocale = "en";
I18n.locale = "en";

const renderComponent = (Component) => {
  ReactDOM.render(
    <Provider store={store}>
      <Component/>
    </Provider>,
    rootEl
  );
};

renderComponent(App);
