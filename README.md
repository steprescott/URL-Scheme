# URL-Scheme

Custom URL schemes allow for other apps, as well as your own, to feed into your app via a simple URL. See [Apple docs](https://developer.apple.com/documentation/uikit/core_app/communicating_with_other_apps_using_custom_urls) for an overview.

The project is split into two apps.

## Setup
- Open `URL-Scheme.xcworkspace`
- Build and run **Host app**
- Build and run **Client app**
- Tap on a link in the **Client app** and see it launch the **Host app**

### Client App
The client app plays the role of an external app (Not yours.). The client app has a set of buttons that when tapped will open their URL. *Please be sure to have the host app installed before opening any link via the client app.*

### Host App
This acts as your app. It has a custom scheme `hostapp:/` so if any URL prefixed with `hostapp:/` is opened, the host app will be called to handle the URL request.

Following Apple's documentation will allow you to add a custom scheme into your `Info.plist`. This project then gives you a good starting point to handle the request in a secure and extendable way.

### Adding a new route to the host app
- Looking to the **Host app** open `URLHandler+Routes.swift`. 
- Add a new case to the `enum Route` e.g. `case test`
- The compiler will moan that the switch below isn't exhaustive. Add your case. e.g. `case .test: log("test"); return true`
- Call that URL via Safari `hostapp:/test`

### Notes
The app does nothing other than handling the URLs. In a normal app you would often navigate to the correct view with the data supplied. This app simply logs the request in a lazy way via `NotificationCentre`.

All of the `URLHandler` functions are fully tested, I've not bothered getting full coverage of the view controllers.

## Why should I add this?
Many apps such as Facebook (`fb:/`), Waze (`waze:/`) and Pinner (`pinner:/`) all support deep links to allow other apps to launch and or add content to their apps. If handled well there should be no security issues and all benefits.

## Security
The main thing to worry about is the parameters you accept via a deeplink. If you had a deep link that took a URL as a parameter you should either look to ways to open that link without accepting the full URL via a deeplink or interrogate the URL to ensure it came from a valid source.

Using the example below we will assume that going to the link below will open the given link in your app. Yes this works well as it allows you to open your webpage inside your app. However, doing this also allows anyone to open a URL inside your app. This means a bad link could convince your users to give over sensitive information.

**Don't**

```
hostapp://web?link=https://mysite.com/pay
```

**Rather**

```
// Open the URL to the pay page via code so the site can't be injected in
hostapp://pay
```

*Or validate URLs*

```
// Valid because it came from https://*.mysite.com/*
hostapp://web?link=https://mysite.com/pay

// Challenge or reject because it's not a whitelisted URL
hostapp://web?link=https://some-bad-site.com/pay
```

As an example of validating deep links ensure you have the **Host app** installed and open Safari. In the URL bar navigate to `hostapp:/color`. This will launch the **Host app** however before processing the link an alert is shown to the user to warn them the URL request came from an unknown source.

Of course these checks are optional however it is best practice if your app might expose sensitive data. 

## In action
![demo](https://user-images.githubusercontent.com/1131458/36632603-4ca260c8-1980-11e8-88b1-585145d14427.gif)