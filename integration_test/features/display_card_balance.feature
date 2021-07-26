@ignore
Feature: Display card balance on account summary screen
    As a user with a with a credit Card,
    I want to see my card balance on my account summary page,
    So that I know what my card balance amount is

    Background: Scenario pre-steps
        Given I open the app

    @ignore
    Scenario: User views a positive value as a card balance on the screen
        Given I am logged in as 'postive.balance@address.uk'
        Then I expect the text 'Your balance is' to be present
        And the 'Card Balance' value has two decimal places
        When I tap the "Personal Loan" link
        Then I expect the text 'Remaining Loan amount' to be present
        And the 'Remaining Loan Amount' value has two decimal places
