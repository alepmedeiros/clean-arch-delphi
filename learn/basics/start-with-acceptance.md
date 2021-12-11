# Start with Acceptance Testing


Acceptance testing is where you should start before writing anything. 
Similarly, if in doubt, always check your acceptance tests and go from there.

Here, we're going to be describing something that looks like the A in [ATDD](https://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development), with [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development) in the mix too.

## What is an acceptance test?

It is a high-level set of tests, written from the perspective of the user, describing steps through the system, and expectations along the way.

In BDD the behaviour of the system might be defined light so: 

```cucumber
Given the light is off
When I turn the light on
Then the light is on
```

Here is the same Cucumber script written as RSpec Ruby:

```ruby
describe 'lighting' do
  let(:system) { LightingSystem.new }
  let(:create_light_use_case) { system.get_use_case(:create_light) }
  let(:turn_light_on_use_case) { system.get_use_case(:turn_light_on) }
  let(:view_light_status_use_case) { system.get_use_case(:view_light_status) }
  
  let(:light_id) do
    response = create_light_use_case.execute
    response[:id]
  end
  
  let(:view_light_status_response) do
    view_light_status_use_case.execute(light_id: light_id)
  end
  
  context 'given the light is off' do
    it 'is off' do
      expect(view_light_status_response[:on]).to be(false)
    end
    
    context 'when I turn the light on' do
      before { turn_light_on_use_case.execute(light_id: light_id) } 
      
      it 'is on' do
        expect(view_light_status_response[:on]).to be(true)
      end
    end
  end
end
```

## Write acceptance tests first

The first step before writing any code is to write a failing acceptance test.

We want to describe what the customer needs before we begin work.

### Why? 

We do not want to 
* get distracted, 
* lose focus,
* write more code than necessary, or 
* run into situations where the moving parts do not work together

**More than anything, we want to understand what we're trying to achieve.**

### What should an acceptance test suite test?

Tests have three components: **Arrange**-**Act**-**Assert**, lets look at what should be exercised in each step.

Let's examine each in reverse order

#### Assert

**Ideally:** Execute a use case and ensure the result it responds with is expected.

```ruby
it 'is off' do
  view_light_status_response = view_light_status.execute(
    light_id: light_id
  )
  expect(view_light_status_response[:on]).to be(false)
end

```

However, if your application is not fully built yet a small shortcut might be to go to a gateway directly to achieve your assertion. This allows you to take small slices through your work. 

Tightly coupling to gateways is not ideal:

* Makes it harder to refactor the interface between use cases and gateways
* Causes acceptance tests to be privvy to the interals of your application i.e. Domain objects
* Your acceptance tests will need to be changed (code churn) more often due to this

##### From the trenches

More than one use case may be aware of a particular Domain object. In situations where this is more than a couple, it is common to extract factories or builders to create Domain objects for you (reused in both test and production code). 

Changing/refactoring the API of a Domain object may require no changes to any acceptance tests if your acceptance specs never see them. Indeed, it is often possible to change one aspect of unit test code to achieve the same end if there are appropriate abstractions in place.  


#### Act

The code you exercise in the Act step of an acceptance test is always going to be a use case's boundary.

```ruby
context 'when I turn the light on' do
  before { turn_light_on_use_case.execute(light_id: light_id) } 
end
```


##### From the trenches
Beware of specifying the needs of your customer in API tests (e.g. Rails feature-spec). 

Let me explain how the Single Responsibility Principle manifests itself in Acceptance Testing.

Tightly coupling descriptions of what your customer needs to your HTTP-stack can cause code churn on your acceptance tests for technical reasons, not domain reasons. For example, a cookie might need to be set, or a new version of HTTP/Ajax/JS requires some _sort of widget to be reticulated_.

It is hard to concentrate on two problems at once. If you are changing a test suite because some _spline needs reticulating in your HTTP SPDY Headers_, are you going to be focussing on the fine points of your customer's domain? 

Could you potentially introduce a hole in your test suite inadvertently? In any moderate-to-complex system that risk is higher than you probably expect.

Acceptance Tests specify the needs of the customer, nothing more or less. 

Separate the concerns both in Production Code and, most importantly, your Test Code.

#### Arrange

Setting up your Acceptance Tests is one of the most difficult of the testing arts to become adept in. 

In the simplest case, your "Arrange" step is merely a case of calling one or more use cases to get the system to the state you need. This is an example of the ideal world, this is what system designers should aim for.

That said, while this is the ideal it may not be practical or possible.

Aim to have your test setup code mimic how you'd expect your application to be used by it's delivery mechanism.

## Should we use Code or a Domain Specific Language?

Gherkin (Cucumber/SpecFlow) and Fitnesse are common DSL choices for writing executable acceptance tests.

If you are involving your (non-programmer) stakeholders in creation and verification of acceptance tests, you should probably use a DSL. If you are not doing this, use code, but try to still use human-readable language. 

```Gherkin
Feature: An customer places an order

Scenario: An existing customer places an order
Given an existing customer
And a valid UK billing address
And a valid UK shipping address
And wants to buy 1x sku 19283
When the order is placed
Then the order is viewable
And there is one line item
And there is valid UK shipping address
And there is a valid UK billing address
And there is a line item for 1x sku 19283 for 10.00 GBP
And the order total is 10.00 GBP
```
