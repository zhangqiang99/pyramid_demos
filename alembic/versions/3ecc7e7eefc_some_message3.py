"""some message3

Revision ID: 3ecc7e7eefc
Revises: 1d3870e5033
Create Date: 2013-11-12 14:44:59.633700

"""

# revision identifiers, used by Alembic.
revision = '3ecc7e7eefc'
down_revision = '1d3870e5033'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('models', sa.Column('value2', sa.Integer(), nullable=True))
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('models', 'value2')
    ### end Alembic commands ###
