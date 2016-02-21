<?php 

class Card extends CaseStudy
{

	public static $count = 0;
	public $img = "";

	function __construct($title, $content, $link, $imgPath){
		$this->setIMG($imgPath); 
		parent::__construct($title, $content, $link);

		self::$count++; 
	}

	public function printCard()
	{

		if (self::$count == 0) 
		{
			echo '<section class="top">';
		} else
		{
			echo '<section>';
		}

		if ($this->getIMG() != "") 
		{
			echo '<aside> <img class="img" src="img/'. $this->getIMG() .'"> </aside> <aside>'; //file name
		} else 
		{
			echo '<aside style="width:100%;">';
		}

		if (parent::getTitle() != "") 
		{
			echo '<h2> ' . parent::getTitle() . '</h2>'; //name
		}

		if (parent::getContent() != "") 
		{
			echo '<p>' . parent::getContent() . '</p>'; //text
		}

		if (parent::getLink() != "") 
		{
			echo '<div><a href="index.php?study=' . parent::getLink() . '"">read more </a></div>'; //html
		}
		echo '</aside> </section>';

		self::$count++;

	}

	public function setIMG($imgPath)
	{
			$this->img = $imgPath;
	}

	public function getIMG()
	{
		return $this->img;
	}
}

?>
