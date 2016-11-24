class @PromisesCategoriesTabs extends React.Component
  render: ->
    # Categorize promises in an object
    categorized_promises = _.groupBy(@props.promises, (promise) -> promise.subject.category)

    promises_tabs = for category, promises of categorized_promises
      local_category = I18n.t("promise.subject.#{category}")
      TabsView.create_tab(category, local_category, `<PromisesList promises={promises}/>`)

    `<TabsView className="tabs-view" tabs={promises_tabs}/>`
