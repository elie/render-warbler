:orphan:

Errors Students May Encounter
------------------------------
Invalid salt

- Occurs when attempting to check password hash using plain text
  password instead of retrieving hashed password from database.

Detached instance error

- Occurs in view tests where an SQLAlchemy instance object is committed,
  saved as variable, and later used where there is a db relationship.

Part One: Fix Current Features
------------------------------

Logout

- Make sure logout feature is implemented as a POST request.
  Can discuss how GET requests are aggressively cached, and
  that logging out has side effects.

- Good time to discuss CSRF protection and using WTForms even
  if user input not collected (still get the token!)

Edit user profile

- Edit form should be pre-populated with existing user data.

- If user deletes the pre-populated image URLs (optional), the
  default images should be used.

- Ensure redirect is only used on success and not if the form has errors.
  Should retain the data a user already entered, so they don't have to
  start over when correcting an error.

Delete user

- Guide students to finding and fixing the security hole for delete
  user: not using WTForm for CSRF protection and should be!

Part Two: Add Likes
-------------------

Students sometimes run into issues with the like/unlike icon
and need to add a CSS Z-index.

Make sure a user can't like their own messages.

Take notice of the runtime when reviewing logic for showing all messages
in Jinja template (and determining if the message shown should be liked
or not).

- Many students have O(n * m)

- Ask if they can do better and discuss alternatives so they can later
  refactor: Storing a user's liked message ids in a set, where to store,
  and where best to add this logic.

How did students approach the like/unlike feature in their routes?
Did they use one route or two?

- Ask them to explain their design decision. Discuss how two routes make
  them idempotent where one route does not, etc...

Within the like view function(s) are students taking advantage of the
ORM and relationship when adding or removing a new message to the
current user's liked messages?

Part Three: Add Tests
---------------------

Great time to discuss fouled transactions.

- Tends to come up in this section as students attempt to test adding new user
  to test can't add with username that already exists.

Detached instance error often comes up here

- Be on the lookout for students who create a new SQLAlchemy instance and try
  to hold onto the entire instance. Should instead only hold onto the instance
  id. If trying to do something with the relationship between two models this
  error often appears.

Be on the lookout for repetitive code that could be moved into helper
functions.

Discuss `Coverage.py`_ tool for measuring percentage of code their tests
cover!

.. _Coverage.py: https://coverage.readthedocs.io/en/coverage-5.3/

- Useful commands:

  - Coverage report -m
  - Coverage html (creates htmlcov directory - delete after or put in
    .gitignore)
