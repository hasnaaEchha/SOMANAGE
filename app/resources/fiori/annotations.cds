using CatalogService as catalog from '../../../srv/catalog-service';

annotate catalog.Viseo_Service with @(UI : {
    Identification  : [{Value : SAP_UUID}],
    SelectionFields : [],
    LineItem: [
        {Value: SAP_UUID},
        {Value: OrderID},
        {Value: SAP_Description},
        {Value: OrderUser},
        {Value: OrderStatus},
        {Value: CreationDate}
    ]
});

annotate catalog.Viseo_Service with {
  SAP_UUID           @title : 'UUID1';
  OrderID           @title : 'ID';
  SAP_Description       @title : 'Description';
  OrderUser      @title : 'User';
  OrderStatus @title : 'Order status';
  CreationDate @title : 'Creation Date';
};


annotate catalog.Sales with @(UI : {
  Identification  : [{Value : country}],
  SelectionFields : [],
  LineItem        : [
  {Value : ID},
  {Value : region},
  {Value : country},
  {Value : amount},
  {
    $Type  : 'UI.DataFieldForAction',
    Label  : '{i18n>boost}',
    Action : 'CatalogService.boost',
    Inline : true
  },
  {Value : comments}
  ],
  HeaderInfo      : {
    TypeName       : '{i18n>country}',
    TypeNamePlural : '{i18n>countries}',
    Title          : {Value : country},
    Description    : {Value : ID}
  }
});

annotate catalog.Sales with {
  ID       @title : '{i18n>ID}'  @UI.HiddenFilter;
  region   @title : '{i18n>region}';
  country  @title : '{i18n>country}';
  amount   @title : '{i18n>amount}';
  comments @title : '{i18n>comments}';
};
