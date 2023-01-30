context("formula interface for header works")

test_that("multi-dim 1", {

# see https://jsfiddle.net/burgerga/4zv58ph0/5
tab3_code <- '<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
<th>c</th>
<th colspan="3">d</th>
</tr>
<tr>
<td colspan="4">e</td>
</tr>
</thead>

<tbody>
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td class = "md" colspan = "4">Header1</td>
</tr>

<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>

<tr>
<td class = "md" colspan = "4">Header2</td>
</tr>


<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>

</tbody>
</table>'

parsedm3 <- doc <- XML::htmlParse(tab3_code)

expect_warning(suppressMessages(tab3m1 <- htmltab(doc = parsedm3, 
                                                  header = "//thead/tr" + "//td[@class = 'md']", 
                                                  body = "//tbody/tr[not(./td[@class = 'md'])]")),
               NULL)
expect_warning(suppressMessages(tab3m2 <- htmltab(doc = parsedm3, 
                                                  header = 1:2 + "//td[@class = 'md']", 
                                                  body = "//tbody/tr[not(./td[@class = 'md'])]")),
               NULL)

  expect_true(is.na(tab3m1[1,1]))
  expect_equal(tab3m1[2,1], "Header1")
  expect_equal(tab3m1[3,1], "Header1")
  expect_equal(tab3m1[4,1], "Header2")
  expect_equal(tab3m1[5,1], "Header2")

  expect_true(is.na(tab3m2[1,1]))
  expect_equal(tab3m2[2,1], "Header1")
  expect_equal(tab3m2[3,1], "Header1")
  expect_equal(tab3m2[4,1], "Header2")
  expect_equal(tab3m2[5,1], "Header2")
})



test_that("multi-dim 2", {

tab4_code <- '<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
<th>c</th>
<th colspan="3">d</th>
</tr>
<tr>
<td colspan="4">e</td>
</tr>
</thead>

<tbody>
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td class = "md0" class="md2" colspan = "4">MAIN 1</td>
</tr>

<tr>
<td class = "md1" class="md2" colspan = "4">Header1</td>
</tr>

<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>

<tr>
<td class = "md1" colspan = "4">Header2</td>
</tr>


<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>

<tr>
<td class = "md0" class="md2" colspan = "4">MAIN 2</td>
</tr>

<tr>
<td class="md1" colspan = "4">Header1</td>
</tr>

<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>

<tr>
<td class = "md1" colspan = "4">Header2</td>
</tr>


<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td></td>
</tr>

<tr>
<td>11</td>
<td>22</td>
<td>33</td>
<td>44</td>
</tr>


</tbody>
</table>'

parsedm4 <- XML::htmlParse(tab4_code)

expect_warning(
  suppressMessages(tab4m1 <- htmltab(doc = parsedm4,
                  header = "//thead/tr" + "//td[@class = 'md1']" + "//td[@class = 'md0']",
                  body = "//tbody/tr[not(./td[starts-with(@class, 'md')])]")),
  NULL)

expect_true(is.na(tab4m1[1,1]))
expect_equal(tab4m1[2,1], "MAIN 1")
expect_equal(tab4m1[6,1], "MAIN 2")
expect_equal(tab4m1[2,2], "Header1")
expect_equal(tab4m1[4,2], "Header2")

})

