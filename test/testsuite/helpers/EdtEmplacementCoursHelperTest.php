<?php

require_once dirname(__FILE__) . '/../../tools/helpers/orm/GeesEmptyTestBase.php';
require_once dirname(__FILE__) . '/../../../orm/helpers/EdtEmplacementCoursHelper.php';
require_once dirname(__FILE__) . '/../orm/base/init_date.php';

/**
 * Test class for EdtEmplacementCoursHelper.
 *
 */
class EdtEmplacementCoursHelperTest extends GeesEmptyTestBase
{
	protected function setUp()
	{
		parent::setUp();
                GeesDataPopulator::populate();
	}

	public function test_getEdtEmplacementCoursActuel()
	{
            $edtCoursCol = EdtEmplacementCoursQuery::create()->find();
            $edtCours = EdtEmplacementCoursHelper::getEdtEmplacementCoursActuel($edtCoursCol, VENDREDI_s45j5.' 11:20:00');
            $this->assertNotNull($edtCours);
        }
}
