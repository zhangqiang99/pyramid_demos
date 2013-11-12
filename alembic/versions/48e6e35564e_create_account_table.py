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
from sqlalchemy import sql
from sqlalchemy import Integer


def upgrade():
    op.alter_column(table_name = 'models',column_name = 'value2',nullable = False,server_default=False,new_column_name = 'value3',type_=Integer)
    


def downgrade():
    op.alter_column(table_name = 'models',column_name = 'value3',nullable = False,server_default=False,new_column_name = 'value2',type_=Integer)
    
