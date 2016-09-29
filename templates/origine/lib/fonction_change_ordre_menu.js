/*
 * @version $Id: $
 *
 * Copyright 2001, 2005 Thomas Belliard, Laurent Delineau, Edouard Hue, Eric Lebrun
 *
 * This file is part of GEES.
 *
 * GEES is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * GEES is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GEES; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

//
function change_onglet(name)
	{
			document.getElementById('onglet_'+anc_onglet).className = 'onglet_0 onglet';
			document.getElementById('onglet_'+name).className = 'onglet_1 onglet';
			document.getElementById('contenu_onglet_'+anc_onglet).style.display = 'none';
			document.getElementById('contenu_onglet_'+name).style.display = 'block';
			anc_onglet = name;

	}


