<?php

require_once dirname(__FILE__) . '/../../tools/helpers/orm/GeesEmptyTestBase.php';

/**
 * Test class for UtilisateurProfessionnel.
 *
 */
class PropelModelPageTest extends GeesEmptyTestBase
{
    protected function setUp()
    {
        parent::setUp();
        GeesDataPopulator::populate();
    }

	
    public function testHaveToPaginateWithMany()
    {
        $query = AbsenceEleveTraitementQuery::create()->joinWith('AbsenceEleveType');
        $traitement_col = $query->paginate(0, 2);
        $this->assertEquals(2, $traitement_col->getResults()->count());
    }
}
