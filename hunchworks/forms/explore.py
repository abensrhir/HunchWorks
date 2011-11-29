#!/usr/bin/env python

from django import forms


class ExploreWorldBankForm(forms.Form):
  indicator = forms.CharField(
    help_text="There are roughly 5000 indicators, you must type 3 letters to see a list of matching indicators. " +
    "You are also only limited to 1 indicator at a time; to see another indicator, remove the first indicator to search again." )
  country = forms.CharField(required=False, 
    help_text="You are limited to entering 4 countries you want to see, however you can see all countries " +
      "for this indicatior by leaving the country field blank. "
      "Please be aware that Continents and Regions cannot be saved for visualizations " +
      "only individual countries can. If you try to visualize regions or continents, you will get an error.")
