# Envato Espresso

Make sure you read **all** of this document carefully, and follow the guidelines
in it. Pay particular attention to the "What We Care About" section. We also
recommend you read
[9 Essential Tips on How to Tackle a Coding Challenge](https://www.codementor.io/learn-programming/9-essential-tips-tackle-coding-challenge).

## Background

We like coffee.

So we built an app to fetch coffee for people from our favourite barista.

The app keeps track of coffee ordered; what the balance is for each user; what users have paid for already; and what is still owed.

## Data

We've got the following data

- `data/prices.json` - provided by our barista. Has details of what beverages are available, and what their prices are.
- `data/orders.json` - list of beverages ordered by users of the app.
- `data/payments.json` - list of payments made by users paying for items they have purchased.

## Requirements

- Load the list of prices
- Load the orders
  - Calculate the total cost of each user's orders
- Load the payments
  - Calculate the total payment for each user
  - Calculate what each user now owes
- Return a JSON string containing the results of this work.

(see `spec/coffee_app_integration_spec.rb` for specific examples)

## Getting Started

Create a directory to work on your project. Copy `envato_coding_test.tar.gz` into your project directory. To extract the project files, run:
```
tar -xzvpf envato_coding_test.tar.gz
```

Envato Espresso requires ruby and bundler to be installed. Before you begin; install the dependencies by running `bundle`.
Once the dependencies have been installed you'll have a few commands available:

- `bundle exec rake`  : Will attempt to run your application and print output to the terminal.
- `bundle exec rspec` : Runs the test suite, we've added a few integration tests to get you started, but you'll probably want to add more as you work.

## Submitting The Test

1. Ensure that everything you wish to submit is committed to the `master` branch
1. In your project directory, run: `tar -czvf firstname_lastname.tar.gz` (where _firstname_ and _lastname_ are your names)
1. Email the generated `.tar.gz` file back to the person that sent you the test.

## What We Care About

First, you should write in Ruby, even if you're not strong in it. We don't mind if your Ruby isn't perfect. If you're *really* not comfortable in Ruby, talk to us, and we'll consider letting you use another language.

We're interested in your method and how you approach the problem just as much as we're interested in the end result. We'll go through your code with you afterwards, and you can talk to us about how you tackled it, why you chose the approach you did, _etcetera_. We don't particularly mind which version of Ruby or Rspec you use or which gems you use to solve the problem.

That said, here's what you should aim for with your code:

- Clean, readable, production quality code; would we want to work with your code as part of a bigger codebase?
- Good object modelling and design decisions. We are looking for an object-oriented solution, even if you think procedural code would make more sense for this problem.
- Extensible code; adding features will be another exercise when you come back in person.
- Good use of Ruby idioms.
- Solid testing approach _(hint - you should write more specs than what has been provided)_
- Use Git (but not GitHub or other public hosting)!
 - Commit small changes often so we can see your approach, and progress.
 - Include the `.git` directory in the packaged .tar.gz file you send to us.
   _(Actually, if you don't do this, the import script that creates a *private*
   GitHub Pull Request from your submitted test for us to review your code
   breaks, and that's bad mojo to start with)_.

We haven't hidden any nasty tricks in the test. Don't overthink it. Just write nice, solid code.

## Do not publish our test

It should go without saying that we don't want other candidates to see our
test or previous submissions.
