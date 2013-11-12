"""create account table value

Revision ID: 48e6e35564e
Revises: 3ecc7e7eefc
Create Date: 2013-11-12 14:50:37.209241

"""

# revision identifiers, used by Alembic.
revision = '48e6e35564e'
down_revision = '3ecc7e7eefc'

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.rename_table('value2','value3')
    


def downgrade():
    op.rename_table('value3','value2')
