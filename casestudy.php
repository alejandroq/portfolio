<?php 

class CaseStudy 
{

	public static $count = 0;
	public $title = "";
	public $content = "";
	public $link = "";

	function __construct($title, $content, $link)
	{
		$this->setTitle($title);
		$this->setContent($content);
		$this->setLink($link);

		if ($this->getContent() != null)
		{
			$this->printCard();
		}

		self::$count++; 
	}

	public function printCard()
	{
		if (self::$count == 0) 
		{
			echo '<section class="top casestudy" style="color:white;background-color:#323232">';
		} else
		{
			echo '<section class="casestudy">';
		}

		echo '<div>';

		if ($this->getTitle() != null) 
		{
			if (self::$count == 0) 
			{
				echo '<h2 style="font-size:1.5em">' . $this->getTitle() . '</h2>'; 
			} else 
			{
				echo '<h2>' . $this->getTitle() . '</h2>'; 
			}
		}

		if ($this->getContent() != null) 
		{
			echo $this->getContent() ; 
		}

		if ($this->getLink() != null) 
		{
			echo '<br>' . $this->getLink(); //html
		}
		echo '</div> </section>';

		self::$count++;

	}

	public function defaultCount()
	{
		self::$count = 0; 
	} 

	public function setTitle($title)
	{
		$this->title = $title;
	}

	public function setContent($content)
	{
		$this->content = $content;
	}

	public function setLink($link)
	{
		$this->link = $link;
	}

	public function getTitle()
	{
		return $this->title;
	}

	public function getContent()
	{
		return $this->content;
	}

	public function getLink()
	{
		return $this->link;
	}
}

?>