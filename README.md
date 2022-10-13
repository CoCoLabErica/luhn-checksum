# luhn-checksum
A simple function that calculates the Luhn checksum for a given number

The checksum function uses the Luhn's algorithm created by Hans Peter Luhn, a German computer scientist at IBM, to calculate the checksum as follows:

Step 1 - Double the value of every other digit from right to left (for example, see <https://en.wikipedia.org/wiki/Luhn_algorithm#Example_for_computing_check_digit>)

Step 2 - If any result of Step 1 has two digits (e.g., 18 because of the digit is 9*2), then add the two digits to get the final result (i.e., 1+8 = 9)

Step 3 - Get the sum by adding all results of the previous step to the remaining digits in the given number

Step 4 - The checksum is `(10 - (sum mod 10)) mod 10` where the `n mod 10` operation gives the remainder after the number n is divided by 10 (i.e., the value of checksum must be a digit between 0 and 9)

The Luhn's algorithm was designed to detect mistyped numbers, and one of its applications is to check whether a credit card number is valid before triggering the payment process with further verification (see <https://www.ibm.com/docs/en/order-management-sw/9.3.0?topic=cpms-handling-credit-cards>).

Note: A correct checksum means the given number is valid, but it doesn't mean an account (e.g., bank account) or an identity (e.g., ID card) associated with the given number exists.

To use the checksum function, simply pass a number without the check digit to the function (e.g., `checksum("7992739871")` for the example from the above mentioned Wikipedia article, or `checksum("462474823324978")` for the example of a Visa credit card number 4624 7482 3324 9780 from the above mentioned IBM documentation), and the function will return the check digit of the given number. The check digit usually is the last digit of the card number or the number in brackets.

Two more credit card number examples from <https://www.ibm.com/docs/en/sga?topic=patterns-credit-card-number>:
<<<<<<< HEAD
=======

>>>>>>> cc0e5ffd77423888bc94cbceb4e28774e42c80ef
`checksum("546046280340313")` returning 2 for a MasterCard credit card of number 5460 4628 0340 3132

`checksum("492990365278615")` returning 8 for a Visa credit card of number 4929 9036 5278 6158

By default, the function will double the value of every other digit from right to left. In case there is a need to double the value of every other digit from left to right, set `double_position="odd"` (e.g., `checksum("7992739871",double_position="odd")`) because doubling from left means doubling the odd position (i.e., 1st, 3rd, 5th, etc.) digits. Use `double_position="odd"`and `double_position="even"` to directly select doubling the odd position digits and doubling the even position digits respectively.

References:
<<<<<<< HEAD
=======

>>>>>>> cc0e5ffd77423888bc94cbceb4e28774e42c80ef
<https://en.wikipedia.org/wiki/Luhn_algorithm>

<https://www.ibm.com/docs/en/order-management-sw/9.3.0?topic=cpms-handling-credit-cards>

<https://www.ibm.com/docs/en/sga?topic=patterns-credit-card-number>

