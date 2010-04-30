OVERVIEW:

MathJax (TM) is an open source, Ajax-based math display solution designed
with a goal of consolidating advances in many web technologies in a
single definitive math-on-the-web platform supporting all major
browsers.

Some of the main features of MathJax include:

  o High-quality display of LaTeX and MathML math notation in HTML pages

  o Supported in most browsers with no plug-ins, extra fonts, or special
    setup for the reader

  o Easy for authors, flexible for publishers, extensible for developers

  o Supports math accessibility, cut and paste interoperability and other
    advanced functionality

  o Powerful API for integration with other web applications

See http://www.mathjax.org/ for additional details.


INSTALLATION:

MathJax can be used on a web server to support mathematics in your
public web pages, or it can be used locally from your hard disck for
your private pages.  To use MathJax in either way, you will need to
obtain a copy of MathJax (see below) and its font pacakge.  These two
are separate pieces because the fonts are not likely to change, while
the main code will be updated fairly regularly.

Obtaining MathJax from SourceForge via SVN:

The easiest way to obtain MathJax and keep it up-to-date is to use the
subversion program (svn) to check it out from the MathJax project at
SourceForge.net.  The page

    http://sourceforge.net/projects/mathjax/develop

lists the command you need to use to obtain a copy of MathJax via svn.
Once you have checked out a version of MathJax, you will find that it
includes a file called "fonts.zip" in the top-level directory.  You
will need to unpack that file in order to complete the installation of
MathJax.  It will create a fonts directory that contains the web fonts
and images fonts used by MathJax to support users who do not have math
fonts installed on their computers.  Once you have checked out
MathJax, you will need to move the MathJax directory to your web
server in a location that is convenient for your use.

Obtaining MathJax from SourceForge as an archive file:

You can obtain MathJax from the MathJax project at SourceForge via
the link

    http://sourceforge.net/projects/mathjax/files/

where you will need to download a copy of the MathJax ZIP file (for
the current version) and the MathJax-webfonts ZIP file.  Unpack the
MathJax ZIP file first, and then unpack the MathJax-webfonts ZIP file
into that.  That should produce a fonts directory in the MathJax
folder (and MathJax/fonts should contain an HTML-CSS directory).  The
fonts directory contains web fonts and image fonts used by MathJax to
support users who do not have math fonts installed on their
computers.  Once you have unpacked both archives, you can move the
MathJax directory to your web server in a location that is convenient
for your use.


TESTING MATHJAX:

Once you have MathJax installed, you can use the files in the
MathJax/test directory to test that your installation is working
properly.  You can also use it to test if your version of MathJax
needs updating.  If you have checked out MathJax using subversion
(svn), you can simply use "svn status" to see if your installation
needs to be updated, and "svn update" to get any updates.


USING MATHJAX IN A WEB PAGE:

To use MathJax in a web page, you need load MathJax.js near the top of
the document (preferably in the document HEAD).  A SCRIPT tag like

    <script type="text/javascript" src="/MathJax/MathJax.js"></script>

will do it if you have MathJax at the top level of your web server.
When called in this form, MathJax can be configured through the file
MathJax/config/MathJax.js, which contains the parameters that control
MathJax.  There are comments in this file that explain what each of
the parameters does, so look there for details.

Alternatively, you can configure MathJax in-line within your web page
(avoiding an extra file transfer).  To do that, place the
configuration information within the SCRIPT tag itself, as in the
following example:

    <script type="text/javascript" src="/MathJax/MathJax.js">
      MathJax.Hub.Config({
        extensions: ["tex2jax.js","TeX/noErrors.js"],
	jax: ["input/TeX","output/HTML-CSS"],
	tex2jax: {inlineMath: [['$','$'],["\\(","\\)"]]},
	"HTML-CSS": {availableFonts:["TeX"]}
      });
    </script>

which loads the tex2jax preprocessor and an extension that causes TeX
errors to show the original TeX code rather than an error message,
specifies the input and output jax (input format is TeX and output
format is HTML/CSS), configures the tex2jax preprocessor to allow
dolar signs to delimit inline-math as well as \(...\), and forces the
HTML/CSS output to use the MathJax TeX fonts (in particular, the STIX
fonts won't be used.)

If you configure MathJax in this fashion, the
MathJax/config/MathJax.js file is not loaded, and your in-line
configuration is used instead.  Note that you can include any of the
parameters from the config/MathJax.js file (and in fact any arbitrary
JavaScript as well).

With the default configuration, MathJax runs the tex2jax preprocessor
to look for TeX-style mathematics delimiters as a means of identifying
the mathematics on the page.  This uses \(...\) to mark in-line
mathematics and \[...\] or $$...$$ for displayed mathematics.  LaTeX
environments can also mark mathematics, as in
\begin{equation}...\end{equation}.  Once the preprocessor runs,
MathJax will typeset the mathematics on the page.

Note that there can not be HTML tags within the math delimiters (other
than <BR>) as TeX-formatted math does not include HTML tags.  Also,
since the mathematics is initially given as text on the page, you need
to be careful that your mathematics doesn't look like HTML tags to the
browser (which parses the page before MathJax gets to see it).  In
particular, that means that you have to be careful about things like
less-than and greater-than signs (<,>), and ampersands (&), which have
special meaning to the browsers.  For example, 

	... when $x<y$ we have ...

will cause a problem, because the brower will think "<y" is the
beginning of a tag named "y" (even though there is no such tag in
HTML).  Usually, it is sufficient to simply put spaces around these
symbols to cause the browser to avoid them, so 

	... when $x < y$ we have ...

should work.  Alternatively, you can use the HTML entities &lt;, &gt;
and &amp; to encode these characters so that the browser will not
interpret them, but MathJax will.  E.g., 

	... when $x &lt; y$ we have ...

Finally, there are \lt and \gt macros defined to make it easier to
enter < and > using TeX-like syntax:

        ... when $x \lt y$ we have ...

Keep in mind that the browser interprets your text before MathJax
does.


MATHJAX WITH NO PREPROCESSOR:

The usual way to use MathJax is with the tex2jax preprocessor, but if
you are generating web pages via some other preprocessor of your own,
you may wish to bypass the tex2math preprocessing and mark the
mathematics in your page directly.  This avoids an extra file
transfer, the time involed in running the tex2jax preprocessor, and
the issues involving less-than, greater-than, and ampersand discussed
in the section above.

When MathJax processes a page, it looks for mathematics stored in
special SCRIPT tags.  These are 

    <script type="math/tex">...</script>

for in-line math, and

    <script type="math/tex; mode=display">...</script>

for displayed math, where the contents of the SCRIPT tags are TeX or
LaTeX mathematics.  Since SCRIPT tags can include less-than,
greater-than, and ampersand characters, this neatly avoids the problem
that these cause when you use the tex2jax preprocessor.

Unfortunately, this method introduces a problem of its own, due to a
bug in Internet Explorer.  The problem is that incorrectly removes
blank spaces from the page in order to avoid what it considers to be
multiple spaces in a row.  in particular, if there is a space both
before and after a tag that IE thinks does not insert content into the
page, it removes one of the two blanks.  Because SCRIPT tags don't
get displayed, IE will remove one of the spaces, so

    ... when <script type="math/tex">x < y</script> we have ...

will become "...whenx < y we have..." in the output, with no space
between the "when" and the "x".  Because the space is removed before
MathJax runs, MathJax has no way to recover the missing space, as it
simply is no longer part of the page as far as IE is concerned.

MathJax provides two different mechanisms to avoid this problem.  One
is to is a prefix or postfix for the mathematics tags, which is text
that you insert before or after the tag that MathJax will remove when
it processes the tag.  Patterns for the prefix and postfix are given
in the "preJax" and "postJax" parameters of the MathJax.Hub.Config()
command (see the MathJax/config/MathJax.js file for more details).
For example, setting

    preJax: "@@"

would mean that

    ... when @@<script type="math/tex">x < y</script> we have ...

would produce ".. when x < y we have ..." properly typeset.  (One need
not use both a preJax and postJax, as one is enough, but both are
provided so that you can use either or both in combination.)  Note,
however, that the "@@" in this example will be displayed as part of
the page until MathJax processes the mathematics and replaces the
preJax with the typeset mathematics.  This may cause visual confusion
that disturbs your readers.  It might be better to use something like
"[math]" as the text for the preJax, since this may make more sense to
your readers.  Because the pre- and postJax are regular expression
patterns (not litteral strings), you will need to handle this
carefully because [ and ] have special meaning in regular expressions.
Use

    preJax: "\\[math\\]"

to make preJax be "\[math\]" (the double backslashes are to quote the
backslash as part of the JavaScript string, and the resulting \[ and
\] quote these characters in the resulting regular expression so they
are treated as literal characters rather than having their special
meansings in regular expressions).

The other approach is to use a "MathJax preview" before the SCRIPT
tag.  This is a means by which you can supply an alternative form for
the mathematics to be displayed in prior to when MathJax runs.  You
could use a simple HTML version (if the mathematics is simple enough),
or an IMG tag, or just the raw TeX code, for example.  Note that the
mathematics between the SCRIPT tags is NOT displayed (since it is a
script, not text), so the preview can be used to show the TeX code up
until the mathematics is typeset.  (The tex2jax preprocessor does that
automatically, for example).  To make a preview, include a SPAN with
CLASS="MathJax_Preview" as the element just before the math SCRIPT
tag, e.g., 

    ... when <span class="MathJax_Preview">x &lt; y</span><script
          type="math/tex">x < y</script> we have ...

This circumvents the Internet Explorer space-removal bug, while at the
same time giving your readers a preview of the mathematics until
MathJax has been able to typeset it.

You can use CSS styles to make it easier to distinguish the preview
from the rest of the text.  For example:

    <script type="text/javascript" src="/MathJax/MathJax.js">
      MathJax.Hub.Config({
        ...
      	styles: {
	  ".MathJax_Preview": {
	    color: "red",
	    border: "1px solid",
	    padding: "2px"
	  }
	},
	...
      });
    </script>

would cause the preview mathematics to be shown in red, with a border
and 2px of padding between the border and the preview text.
