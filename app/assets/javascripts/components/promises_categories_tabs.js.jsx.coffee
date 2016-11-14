class @PromisesCategoriesTabs extends React.Component
  render: ->
    # Categorize promises in an object
    categorized_promises = {}
    for promise in @props.promises
      categorized_promises[promise.subject.category] ?= []
      categorized_promises[promise.subject.category].push(promise)

    promises_tabs = for category, promises of categorized_promises
      local_category = I18n.t("promise.subject.#{category}")
      TabsView.create_tab(category, local_category, `<PromisesList promises={promises}/>`)

    `<TabsView className="promises-list" tabs={promises_tabs}/>`
