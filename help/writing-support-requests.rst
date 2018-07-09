

How to write good support requests
==================================

Writing good support requests is not only good for the support team, it is also
better for you because we have many help requests, so the easier it is
to understand yours, the faster we will get to it. Below is a list of
good practices.


Never send support requests to staff members directly
-----------------------------------------------------

Always send them to support@metacenter.no and staff members will pick them
up there. On support@metacenter.no they get tracked and have higher visibility.
Some staff members work on the support line only part time.
Sending the request to support@metacenter.no makes sure that somebody will pick
it up. Please note in the request that it is about Stallo, as there are more
clusters that are handled with this email address.


Give descriptive subject
------------------------

Your subject line should be descriptive. "Problem on Stallo" is not a good
subject line since it could be valid for basically every support email we get.
The support staff is a team. The subjects are the first thing that we see. We
would like to be able to classify emails according to subjects before even
opening the email.

Include actual commands and error messages
------------------------------------------
We cover this below, but it's so important it needs to be mentioned at
the top, too: include the actual command you run and actual error
messages.  Copy and paste.  If you don't include this, we will be
slightly annoyed and immediately ask this.

New problem new email
---------------------

Do not send support requests by replying to unrelated issues. Every issue gets a
number and this is the number that you see in the subject line. Replying to
unrelated issues means that your email gets filed under the wrong thread and
risks being overlooked.


The XY problem
--------------

This is a classic problem. Please read http://xyproblem.info.  Often we know
the solution but sometimes we don't know the problem.

In short (quoting from http://xyproblem.info):

* User wants to do X.

* User doesn't know how to do X, but thinks they can fumble their way to a solution if they can just manage to do Y.

* User doesn't know how to do Y either.

* User asks for help with Y.

* Others try to help user with Y, but are confused because Y seems like a strange problem to want to solve.

* After much interaction and wasted time, it finally becomes clear that the user really wants help with X, and that Y wasn't even a suitable solution for X.

To avoid the XY problem, if you struggle with Y but really what you are after
is X, please also tell us about X. Tell us what you really want to achieve.
Solving Y can take a long time.  We have had cases where after enormous effort
on Y we realized that the user wanted X and that Y was not the best way to
achieve X.


Tell us also what worked
------------------------

Rather often we get requests of the type "I cannot get X to run on two nodes".  The
request then does not mention whether it worked on one node or on one core or
whether it never worked and that this was the first attempt.
Perhaps the problem has even nothing to do with one or two nodes.
In order to better
isolate the problem and avoid wasting time with many back and forth emails,
please tell us what actually worked so far.  Tell us what you have tried to
isolate the problem.  This requires some effort from you but this is what we
expect from you.


Specify your environment
------------------------

Have you or your colleague compiled the code? Which modules were loaded?
If you use non-default modules and you do not tell us about it, we will
waste time when debugging with in a different environment.


Simple cases: Be specific, include commands and errors
------------------------------------------------------

Whatever you do, don't say that "X didn't work".  Exactly give the
commands you ran, environment (see above), and output error messages.
The actual error messages mean a lot - include all the output, it is
easy to copy and paste it.

The better you describe the problem the less we have to guess and ask.

Sometimes, just seeing the actual error message is enough to give an
useful answer.  For all but the simplest cases, you will need to make
the problem reproducible, which you should *always* try anyway.  See
the following points.


Complex cases: Create an example which reproduces the problem
-------------------------------------------------------------

Create an example that we can ideally just copy paste and run and which
demonstrates the problem. It is otherwise very time consuming if the support
team needs to write input files and run scripts based on your possibly
incomplete description. See also next point.  Make this example available to
us. We do not search and read read-protected files without your permission.


Make the example as small and fast as possible
----------------------------------------------

You run a calculation which crashes after running for one week. You are tempted
to write to support right away with this example but this is not a good idea.
Before you send a support request with this example, first try to reduce it.
Possibly and probably the crash can be reproduced with a much smaller example
(smaller system size or grid or basis set).  It is so much easier to schedule
and debug a problem which crashes after few seconds compared to a run which
crashes after hours.  Of course this requires some effort from you but this is
what we expect from you in order to create a useful support request.
Often when isolating the problem, the problem and solution crystallize before
even writing the support request.
