<?php

//class documents 
require 'class/casestudy.php';
require 'class/card.php';

function defaultView()
{
    if (isset($_GET['study'])) 
    {
        if ($_GET['study'] > 0)
        {
            echo 
            ' <style media="screen" type="text/css">

                #about {
                    display:none;
                }
                #casestudy {
                    display:block;
                }

            </style> 
            ';
        }
    }
}

function defaultJS()
{
    if (!isset($_GET['study'])) 
    {
        echo 
        " <script type=\"text/javascript\">
                var x = 0;
                    if (x == 0) {
                        $('header .about').css({textDecoration:'underline', background:'#ECF6CE'});
                    }
            </script>
        ";  
    } 
}

function createCards() 
{
    require 'connection.php';


    $sql = 'SELECT * FROM cards ORDER BY ID DESC';
    $result = $conn->query($sql);

    if ($result->num_rows > 0) 
    {
        while ($row = $result->fetch_assoc()) 
        {
            $title = $row['title'];
            $content = $row['content'];
            $link = $row['link'];
            $imgPath = $row['imgPath'];

            if ($imgPath == null) 
            {
                $imgPath = "";
            }

            if ($link == null) 
            {
                $link = "";
            }

            if ($content == null) 
            {
                $content = "";
            }

            if ($title == null)
            {
                $title = "";
            }

            $card = new Card($title, $content, $link, $imgPath);
        }
        $card->defaultCount();
    }
}

function createCaseStudy()
{
    require 'connection.php';

    if (isset($_GET['study'])) 
    {
        if (intval($_GET['study']) <> 0) 
        {
            echo '<article id="casestudy">';
            $sql = 'SELECT ID, title, content, link FROM casestudy WHERE parent = ' . intval($_GET['study']) . ' ORDER BY ID ASC'; 
            $result = $conn->query($sql);

            if ($result->num_rows > 0) 
            {
                while ($row = $result->fetch_assoc()) 
                {
                    $title = $row['title'];
                    $content = $row['content'];
                    $link = $row['link'];

                    if ($link == null) 
                    {
                        $link = "";
                    }

                    if ($content == null) 
                    {
                        $content = "";
                    }

                    if ($title == null)
                    {
                        $title = "";
                    }

                    $casestudy = new CaseStudy($title, $content, $link);
                }
            } else 
            {
                echo '  <section class="top"> 
                                <h2>Error: Content Stolen.</h2>
                                <p>Our band of fighting monkeys are on the job. Over and out.</p>
                        </section>  ';
            }
            $temp = new CaseStudy('','','');
            $temp->defaultCount();
            echo '</article>';
        }
    }
}

function printFooterSection()
{
    require 'connection.php';

    $sql = 'SELECT title FROM cards ORDER BY ID DESC';
    $result = $conn->query($sql);

    if ($result->num_rows > 0) 
    {
        $title = $row['title'];

        if ($title!=null)
        {
            echo '<li><a href=""><p>' . $title . '</p></a></li>'
        }
    }
}

?>
