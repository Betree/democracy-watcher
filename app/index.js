import React from "react";
import ReactDOM from 'react-dom';
import {AppContainer} from "react-hot-loader";

import I18n from "i18n-js"
import "./translations"

import App from "./components/App/App";

const rootEl = document.getElementById("root");

// TODO Real config for i18n
I18n.defaultLocale = "en";
I18n.locale = "en";

const renderComponent = (Component) => {
  ReactDOM.render(
    <AppContainer>
        <Component/>
    </AppContainer>,
    rootEl
  );
};

renderComponent(App);

// Hot Module Replacement API
if (module.hot) {
  module.hot.accept("./components/App/App", () => {
    const NewApp = require("./components/App/App").default;
    renderComponent(NewApp);
  });
}
